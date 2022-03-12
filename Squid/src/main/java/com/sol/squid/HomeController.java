package com.sol.squid;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sol.squid.review.ReviewDAO;

@Controller
public class HomeController {
	
	@Autowired
	private ReviewDAO rDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req) {
		
		rDAO.getReviews(model, req);
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "index.go", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest req) {
		
		rDAO.getReviews(model, req);
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/aboutus.go", method = RequestMethod.GET)
	public String aboutUs(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "about/aboutUs.jsp");
		return "index";
	}
	
	@Autowired
	private JavaMailSender mailSender;
    
	//mailSend 코드
	@RequestMapping(value = "/mail/mailSend", method = RequestMethod.POST)
	public String mailSend(HttpServletRequest request,String name,String last_name,String email,String phone,String message) {
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom(email); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo("oh971021@gmail.com"); // 받는사람 이메일
		    messageHelper.setSubject("안녕하세요 저는" + name + last_name + "입니다."); // 메일제목
		    messageHelper.setText(message + " 연락처는 " + phone + "입니다. Email은 " + email + "입니다."); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
}
