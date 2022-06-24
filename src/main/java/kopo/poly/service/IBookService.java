package kopo.poly.service;

import kopo.poly.dto.BookDTO;

import java.util.List;

public interface IBookService {

    int InsertBook(BookDTO pDTO) throws Exception;

    List<BookDTO> getAdminInfo(BookDTO pDTO) throws Exception;

    List<BookDTO> getUserInfo(BookDTO pDTO) throws Exception;

    int updateBook(BookDTO cDTO) throws Exception;

    int deleteBook(BookDTO uDTO);
}