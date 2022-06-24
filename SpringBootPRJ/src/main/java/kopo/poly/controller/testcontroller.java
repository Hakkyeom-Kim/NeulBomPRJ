package kopo.poly.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class testcontroller {

    @RequestMapping("/")
    public String Hello() {
        return "제발 졸업하게 해주세요!!!!";
    }

    @RequestMapping(value = "index")
    public String loginForm() {
        log.info(this.getClass().getName() + ".index ok!");

        return "index";
    }

    @RequestMapping(value = "hello")
    public String userhello() {
        log.info(this.getClass().getName() + ".user/hello ok!");

        return "hello";
    }

}