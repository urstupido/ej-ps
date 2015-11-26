package com.sds.ps.ntos.custcontract.custcontractfinder.web;

import java.sql.Date;
import java.util.Collection;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ps.domain.CodeInfo;
import com.sds.ps.domain.CustContract;
import com.sds.ps.ntos.codefinder.service.CodeService;
import com.sds.ps.ntos.custcontract.custcontractfinder.service.CustContractService;

@Controller("ntosCustContractController")
@RequestMapping("/ntosCustContract.do")
@SessionAttributes(types = CustContract.class)
public class CustContractController {

	@Inject
	@Named("ntosCustContractService") 
	private CustContractService custContractService;

	@Inject
	@Named("ntosCodeService")
	private CodeService codeService;
	
	@ModelAttribute("incoCodeList")
	public Collection<CodeInfo> populateGenreList() throws Exception {
		return this.codeService.getList("INCO_STAC_C");
	}
	
	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new CustContract());
		return "ntosViewCustContract";
	}

	@RequestMapping(params = "method=create")
	public String create(@Valid CustContract custContract, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		this.custContractService.create(custContract);
		status.setComplete();
		
		return "redirect:/ntosCustContractFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("contNo") String contNo, Model model)
			throws Exception {
		CustContract custContract = this.custContractService.get(contNo);
		System.out.println("=====================================Controller==================");
		System.out.println("contNo"+contNo);
		System.out.println(custContract.toString());
//		if (custContract == null) {
//			System.out.println("널이니??");
//			throw new Exception("Resource not found " + contNo);
//		}
		model.addAttribute(custContract);

		return "ntosViewCustContract";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid CustContract custContract, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewCustContract";
		}
		this.custContractService.update(custContract);
		status.setComplete();
		return "redirect:/ntosCustContractFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("contNo") String contNo)
			throws Exception {
		this.custContractService.remove(contNo);
		return "redirect:/ntosCustContractFinder.do?method=list";
	}
}
