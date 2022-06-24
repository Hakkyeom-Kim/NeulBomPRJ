package kopo.poly.service.impl;

import kopo.poly.dto.BookDTO;
import kopo.poly.persistance.mapper.IBookMapper;
import kopo.poly.service.IBookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service("BookService")
public class BookService  implements IBookService {

    private final IBookMapper bookMapper;


    @Autowired
    public BookService(IBookMapper bookMapper) {this.bookMapper = bookMapper;}

    @Transactional
    @Override
    public int InsertBook(BookDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertBook start!");

        return bookMapper.InsertBook(pDTO);
    }

    @Override
    public List<BookDTO> getAdminInfo(BookDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + ".getBookInfo start!");

        return bookMapper.getAdminInfo(pDTO);
    }

    @Override
    public List<BookDTO> getUserInfo(BookDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + ".chatroom create!");

        return bookMapper.getUserInfo(pDTO);
    }

    @Override
    public int updateBook(BookDTO cDTO) throws Exception {
        log.info(this.getClass().getName() + ".updateBook start!");

        return bookMapper.updateBook(cDTO);

    }

    @Override
    public int deleteBook(BookDTO uDTO) {
        log.info(this.getClass().getName() + ".updateBook start!");

        return bookMapper.deleteBook(uDTO);

    }
}