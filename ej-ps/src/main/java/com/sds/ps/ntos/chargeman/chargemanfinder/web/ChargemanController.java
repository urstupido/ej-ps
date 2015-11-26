package com.sds.ps.ntos.chargeman.chargemanfinder.web;

import java.sql.Date;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ps.domain.Chargeman;
import com.sds.ps.ntos.chargeman.chargemanfinder.service.ChargemanService;

@Controller("ntosChargemanController")
@RequestMapping("/ntosChargeman.do")
@SessionAttributes(types = Chargeman.class)
public class ChargemanController {

	@Inject
	@Named("ntosChargemanService") 
	private ChargemanService chargemanService;

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Chargeman());
		return "ntosAddChargeman";
	}

	@RequestMapping(params = "method=create")
	public String create(@Valid Chargeman chargeman, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		chargeman.setLastChngUsid("test");
		chargeman.setLastChngDt(new Date(0));
		/*if(results.hasErrors()){
			for (ObjectError e : results.getAllErrors()) {
				System.out.println(e.toString());
			}
			return "ntosViewCustomer";
		}*/
		
		this.chargemanService.create(chargeman);
		status.setComplete();
		
		return "redirect:/ntosChargemanFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("contNo") String contNo,
					  @RequestParam("chmnSeq") String chmnSeq,
					  Model model)
			throws Exception {
		Chargeman chargeman = this.chargemanService.get(contNo, chmnSeq);
		if (chargeman == null) {
			throw new Exception("Resource not found " + contNo+ chmnSeq);
		}
		model.addAttribute(chargeman);
		
		System.out.println("==============================================");
		System.out.println(model.toString());

		return "ntosViewChargeman";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Chargeman chargeman, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewChargeman";
		}
		this.chargemanService.update(chargeman);
		status.setComplete();
		return "redirect:/ntosChargemanFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("contNo") String contNo)
			throws Exception {
		this.chargemanService.remove(contNo);
		return "redirect:/ntosChargemanFinder.do?method=list";
	}
}
