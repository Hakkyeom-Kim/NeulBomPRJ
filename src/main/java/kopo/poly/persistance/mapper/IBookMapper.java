package kopo.poly.persistance.mapper;

import kopo.poly.dto.BookDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBookMapper {

    int InsertBook(BookDTO pDTO) throws Exception;

    List<BookDTO> getAdminInfo(BookDTO pDTO) throws Exception;

    List<BookDTO> getUserInfo(BookDTO pDTO) throws Exception;

    int updateBook(BookDTO cDTO);

    int deleteBook(BookDTO uDTO);


}