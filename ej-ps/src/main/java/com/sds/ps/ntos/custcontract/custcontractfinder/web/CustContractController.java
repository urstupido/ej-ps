package com.sds.ps.ntos.custcontract.custcontractfinder.web;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	
//	@ModelAttribute("codeList")
//	public Collection<Code> populateGenreList() throws Exception {
//		return this.codeService.getList("PROD_LCLS_C");
//	}
	
	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new CustContract());
		return "ntosViewCustContract";
	}

	/*@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Product Product, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if (results.hasErrors()) {
			return "ntosViewProduct";
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
							"Fail to create a directory for Product image. ["
									+ destDir + "]");
				}
			}
			
			File destination = File
					.createTempFile("file", pictureName, dirPath);

			FileCopyUtils.copy(posterFile.getInputStream(),
					new FileOutputStream(destination));

			Product.setPosterFile("sample/images/posters/"
					+ destination.getName());
		}

		this.ProductService.create(Product);
		status.setComplete();

		return "redirect:/ntosProductFinder.do?method=list";
	}*/

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("contNo") String contNo, Model model)
			throws Exception {
		CustContract custContract = this.custContractService.get(contNo);
		if (custContract == null) {
			throw new Exception("Resource not found " + contNo);
		}
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
