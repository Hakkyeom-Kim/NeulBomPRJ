package kopo.poly.controller;

import kopo.poly.service.IUserInfoService;
import kopo.poly.service.IcallapiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
public class callapiController {
    @Resource(name = "callapiService")
    private IcallapiService callapiService;

    @GetMapping("/api")
    public String callApi() throws Exception {
        log.info(this.getClass().getName() + ".api ok!");

//       String res = callapiService.callsido();

//        String res2 = callapiService.callsigungu();
//
        String res3 = callapiService.callshelter();
//
//        String res4 = callapiService.callkind();
//



       return res3  ;
    }


}




