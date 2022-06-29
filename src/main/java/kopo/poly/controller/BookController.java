package kopo.poly.controller;

import kopo.poly.dto.BookDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IBookService;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class BookController {

    @Resource(name = "BookService")
    private IBookService bookService;

    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

    @PostMapping(value = "/getUserInfo")
    public String InsertBoot(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {


        String Userid = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
        UserInfoDTO uDTO = new UserInfoDTO();
        uDTO.setUser_id(Userid);


        UserInfoDTO rDTO = userInfoService.getUserInfo(uDTO);


        log.info(this.getClass().getName() + ".InsertBook start!");

        String msg="";
        String careNm = CmmUtil.nvl(request.getParameter("CARE_NM"));
        String careAddr = CmmUtil.nvl(request.getParameter("CARE_ADDR"));
        String kindCd = CmmUtil.nvl(request.getParameter("KIND_CD"));
        String user_name = rDTO.getUser_name();
        String user_id = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
        String reg_dt = CmmUtil.nvl(DateUtil.getDateTime("yyyy.MM.dd.HH.mm.ss"));
        log.info("careNm" + careNm);
        log.info("careAddr" + careAddr);
        log.info("kindCd" + kindCd);
        log.info("user_name" + user_name);
        log.info("user_id" + user_id);
        log.info("reg_dt" + reg_dt);


        BookDTO pDTO = new BookDTO();
        pDTO.setCare_nm(careNm);
        pDTO.setCare_addr(careAddr);
        pDTO.setKind_cd(kindCd);
        pDTO.setUser_name(user_name);
        pDTO.setUser_id(user_id);
        pDTO.setReg_dt(reg_dt);
        int res = bookService.InsertBook(pDTO);
        if(res == 1) {
            msg = "예약되었습니다.";
            model.addAttribute("msg", msg);
//            model.addAttribute("bDTO", pDTO);
            return "redirect:/Book/BookList";
        } else {
            msg = "실패하였습니다.";
            model.addAttribute("msg", msg);
            return "/Book/Mag2";
        }
    }

    @RequestMapping(value = "/Book/BookResult1")
    public String BookInfo(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".BookInfo");

        BookDTO bookDTO = new BookDTO();

        String userId = String.valueOf(session.getAttribute("USER_ID"));

        String Book_seq = request.getParameter("book_seq");
        String Carenm = request.getParameter("Carenm");
        String Careaddr = request.getParameter("Careaddr");
        String Kindcd = request.getParameter("Kindcd");
        String user_name = request.getParameter("user_name");
        String reg_dt = request.getParameter("reg_dt");

        log.info("bookseq" + Book_seq);
        log.info("careNm" + Carenm);
        log.info("careAddr" + Careaddr);
        log.info("kindCd" + Kindcd);
        log.info("user_name" + user_name);
        log.info("user_id" + userId);
        log.info("reg_dt" + reg_dt);


        bookDTO.setBook_seq(Integer.parseInt(Book_seq));
        bookDTO.setUser_id(userId);
        bookDTO.setCare_nm(Carenm);
        bookDTO.setKind_cd(Kindcd);
        bookDTO.setCare_addr(Careaddr);
        bookDTO.setUser_name(user_name);
        bookDTO.setReg_dt(reg_dt);

        model.addAttribute("bDTO", bookDTO);

//        List<BookDTO> bookDTOList = bookService.getUserInfo(bookDTO);
//
//        log.info("bookDtoList Size : " + bookDTOList.size());
//
//        model.addAttribute("bookDTOList", bookDTOList);


        log.info(this.getClass().getName() + ".BookResult1 End!!");


        return "/Book/BookResult1";
    }
    @RequestMapping(value = "/Book/BookList")
    public String getUserType(HttpSession session, ModelMap model) throws Exception {
        String Userid = CmmUtil.nvl((String) session.getAttribute("USER_ID"));
        log.info("Userid" + Userid);
        String Username = CmmUtil.nvl((String) session.getAttribute("USER_NAME"));
        log.info("Username" + Username);
        int Usertype = (int) session.getAttribute("USER_TYPE");
        log.info("Usertype" + Usertype);

        BookDTO bDTO = new BookDTO();
        List<BookDTO> bList;
        if (Usertype == 1) { //관리자면 이름이 관리자명(보호소명)인 예약정보 리스트 가져오기
            bDTO.setCare_nm(Username);
            bList = bookService.getAdminInfo(bDTO);
            log.info("blist" + bList);
            log.info("bList.size : " + bList.size());
            model.addAttribute("bList", bList);
        } else { //일반 유저면 자신 아이디로 예약정보 리스트를 가져온다.
            bDTO.setUser_id(Userid);
            log.info("user_id :" + bDTO.getUser_id());
            bList = bookService.getUserInfo(bDTO);
            for(BookDTO rDTO : bList) {
                log.info("보호소이름 : " + rDTO.getCare_nm());
            }
            log.info("bList.size : " + bList.size());
            model.addAttribute("bList", bList);
        }

        return "/Book/BookList";
    }

    @RequestMapping (value = "updateBook")
    public String updateBook (HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".updateBook Start!");
        String msg="";

        int seq = Integer.parseInt(request.getParameter("bookSeq"));
        String newDate = request.getParameter("newDate");

        BookDTO cDTO = new BookDTO();
        cDTO.setBook_seq(seq);
        cDTO.setReg_dt(newDate);

        int res = bookService.updateBook(cDTO);

        if (res == 1) {
            log.info("날짜변경 완료!");
            msg = "예약이 변경되었습니다.";
            model.addAttribute("msg", msg);
        } else{
            log.info("날짜변경 실패!");
            msg = "문제가 발생했습니다. 다시 시도하여주시기 바랍니다.";
            model.addAttribute("msg", msg);
        }

        return "redirect:/Book/BookList";
    }

    @RequestMapping (value = "/deleteBook")
    public String deleteBook (HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".deleteBook Start!");
        String msg="";

        int seq = Integer.parseInt(request.getParameter("bookSeq"));
        String xDate = request.getParameter("xDate");

        BookDTO uDTO = new BookDTO();
        uDTO.setBook_seq(seq);
        uDTO.setReg_dt(xDate);


        int res = bookService.deleteBook(uDTO);

        if (res == 1) {
            log.info("삭제완료!");
            msg = "삭제되었습니다.";
            model.addAttribute("msg", msg);
        } else{
            log.info("삭제 실패!");
            msg = "문제가 발생했습니다. 다시 시도하여주시기 바랍니다.";
            model.addAttribute("msg", msg);
        }

        return "redirect:/Book/BookList";
    }

}