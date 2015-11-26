package com.sds.ps.ntos.customerfinder.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Date;
import java.util.Collection;

import javax.imageio.ImageIO;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.sds.ntos.customerfinder.service.CustomerService;
import com.sds.ps.domain.CodeInfo;
import com.sds.ps.domain.Customer;
import com.sds.ps.ntos.codefinder.service.CodeService;

@Controller("ntosCustomerController")
@RequestMapping("/ntosCustomer.do")
@SessionAttributes(types = Customer.class)
public class CustomerController {

	@Inject
	@Named("ntosCustomerService")
	private CustomerService customerService;

	@Inject
	@Named("ntosCodeService")
	private CodeService codeService;

	@ModelAttribute("codeList")
	public Collection<CodeInfo> populateGenreList() throws Exception {
		return this.codeService.getList("USER_TC");
	}

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Customer());
		return "ntosViewCustomer";
	}

	@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPictureFile", required = false) MultipartFile pictureFile,
			@Valid Customer customer, BindingResult results,
			SessionStatus status, HttpSession session) throws Exception {
		customer.setLastChngUsid("test");
		customer.setLastChngDt(new Date(0));
		
		if (results.hasErrors()) {
			return "ntosViewCustomer";
		}

		if (pictureFile != null
				&& !pictureFile.getOriginalFilename().equals("")) {
			customer.setPictureFile("/sample/images/picture/");
		}

		this.customerService.create(customer);
		status.setComplete();

		if (pictureFile != null
				&& !pictureFile.getOriginalFilename().equals("")) {
			byte[] imageData = pictureFile.getBytes();
			BufferedImage inputImage = ImageIO.read(new ByteArrayInputStream(
					imageData));

			String pictureName = customer.getCusNo();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/picture/");

			File file = new File(destDir + "/" + pictureName + ".png");

			ImageIO.write(inputImage, "png", file);

		}

		return "redirect:/ntosCustomerFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("cusNo") String cusNo, Model model)
			throws Exception {
		Customer customer = this.customerService.get(cusNo);
		if (customer == null) {
			throw new Exception("Resource not found " + cusNo);
		}
		model.addAttribute(customer);
		return "ntosViewCustomer";
	}

	@RequestMapping(params = "method=update")
	public String update(
			@RequestParam(value = "realPictureFile", required = false) MultipartFile pictureFile,
			@Valid Customer customer, BindingResult results,
			SessionStatus status, HttpSession session) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewCustomer";
		}
		
		if (pictureFile != null
				&& !pictureFile.getOriginalFilename().equals("")) {
			byte[] imageData = pictureFile.getBytes();
			BufferedImage inputImage = ImageIO.read(new ByteArrayInputStream(
					imageData));

			String pictureName = customer.getCusNo();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/picture/");

			File file = new File(destDir + "/" + pictureName + ".png");

			ImageIO.write(inputImage, "png", file);

			customer.setPictureFile("/sample/images/picture/"+customer.getCusNo()+".png");
		}
		
		this.customerService.update(customer);
		status.setComplete();

		return "redirect:/ntosCustomerFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	@ResponseBody
	public String remove(@RequestParam("cusNo") String cusNo,
			HttpSession session) throws Exception {
		this.customerService.remove(cusNo);
		String destDir = session.getServletContext().getRealPath(
				"/sample/images/picture/");
		try {
			File file = new File(destDir + "/" + cusNo + ".png");
			file.delete();
		} catch (Exception e) {
		}
		return "true";
	}
}
