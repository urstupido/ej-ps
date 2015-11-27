package com.sds.ps.ntos.contract.contractfinder.web;

import java.awt.List;
import java.util.Collection;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import sun.security.action.GetLongAction;
import anyframe.common.Page;

import com.sds.ps.domain.CodeInfo;
import com.sds.ps.domain.Contract;
import com.sds.ps.ntos.codefinder.service.CodeService;
import com.sds.ps.ntos.contract.contractfinder.service.ContractService;


@Controller("ntosContractController")
@RequestMapping("/ntosContract.do")
@SessionAttributes(types = Contract.class)
public class ContractController {

	@Inject
	@Named("ntosContractService") 
	private ContractService ContractService;

	@Inject
	@Named("ntosCodeService")
	private CodeService codeService;
	

	@ModelAttribute("BankList")
	public Collection<CodeInfo> populateBankList() throws Exception {
		return this.codeService.getList("BNK_C");
	}
	@ModelAttribute("PlanKindList")
	public Collection<CodeInfo> populatePlanKindList() throws Exception {
		return this.codeService.getList("PLAN_KIND_C");
	}
	@ModelAttribute("ContProcList")
	public Collection<CodeInfo> populateContProcList() throws Exception {
		return this.codeService.getList("CONT_PROC_STAT_C");
	}
	
	
	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Contract());
		
		return "ntosViewContract";
	}

	/*@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Contract Contract, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if (results.hasErrors()) {
			return "ntosViewContract";
		}
		
		System.out.println(results);
		
		if (posterFile != null && !posterFile.getOriginalFilename().equals("")) {
			String pictureName = posterFile.getOriginalFilename();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/posters/");

			File dirPath = new File(destDir);
			if (!dirPath.exists()) {
				boolean created = dirPath.mkdirs();
				if (!created) {
					throw new Exception(
							"Fail to create a directory for Contract image. ["
									+ destDir + "]");
				}
			}
			
			File destination = File
					.createTempFile("file", pictureName, dirPath);

			FileCopyUtils.copy(posterFile.getInputStream(),
					new FileOutputStream(destination));

			Contract.setPosterFile("sample/images/posters/"
					+ destination.getName());
		}

		this.ContractService.create(Contract);
		status.setComplete();

		return "redirect:/ntosContractFinder.do?method=list";
	}*/

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("contNo") String contNo, Model model)
			throws Exception {
		Contract Contract = this.ContractService.get(contNo);
		System.out.println(Contract);
		if (Contract == null) {
			throw new Exception("Resource not found " + contNo);
		}
		model.addAttribute(Contract);

		return "ntosViewContract";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Contract contract, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewContract";
		}
		this.ContractService.update(contract);
		status.setComplete();
		return "redirect:/ntosContractFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("ContractId") String ContractId)
			throws Exception {
		this.ContractService.remove(ContractId);
		return "redirect:/ntosContractFinder.do?method=list";
	}
}
