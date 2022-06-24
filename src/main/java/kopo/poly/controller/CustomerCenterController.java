package kopo.poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kopo.poly.dto.MailDTO;
import kopo.poly.service.IMailService;
import kopo.poly.util.CmmUtil;

@Slf4j
@Controller("CustomerCenterController")

public class CustomerCenterController {


    @Resource(name = "MailService")
    private IMailService mailService;

    @RequestMapping(value = "/customerCenter/csCenterMail")
    public String Mail(HttpServletRequest request, HttpSession session, ModelMap model,
                       HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".customerCenter/csCenterMail");


        return "/customerCenter/csCenterMail";
    }

    @RequestMapping(value = "/customerCenter/csCenterMails")
    public String Mails(HttpServletRequest request, HttpSession session, ModelMap model,
                        HttpServletResponse response) throws Exception {

        log.info(this.getClass().getName() + ".customerCenter/csCenterMails");

        String toMail = "khkcar@naver.com";
        String title = CmmUtil.nvl(request.getParameter("title"));
        String contents = CmmUtil.nvl(request.getParameter("contents"));

        // 값 들어갔는지 확인
        log.info(toMail);
        log.info(title);
        log.info(contents);

        MailDTO pDTO = new MailDTO();

        pDTO.setToMail(toMail);
        pDTO.setTitle(title);
        pDTO.setContents(contents);

        int res = mailService.doSendMail(pDTO);

        if (res == 1) {
            log.info(this.getClass().getName() + "mail.sendMail success !");
        } else {
            log.info(this.getClass().getName() + "mail.sendMail fail !");
        }

        model.addAttribute("res", String.valueOf(res));

        log.info(this.getClass().getName() + "mail.sendMail end !");

        return "/customerCenter/customerCenterAlert";
    }

}