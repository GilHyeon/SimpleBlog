package com.gilhyeon.simpleblog.service;

import com.gilhyeon.simpleblog.domain.Blog;
import com.gilhyeon.simpleblog.repository.BlogRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by gilhyeon on 2017-05-09.
 */

@Service
public class BlogService {
    final static Logger logger = LoggerFactory.getLogger(BlogService.class);

    @Autowired
    BlogRepository blogRepository;

    public List<Blog> findAll() {
        return blogRepository.findAll();
    }

    public Blog findOne(Long id) {
        return blogRepository.findOne(id);
    }

    public Blog save(Blog blog) {
        /**
         * 신규/수정 여부를 확인한다.
         * 기준 : 작성일이 null인지 검사한다.
         */
        if(blog.getCreatedDate() == null)
            blog.setCreatedDate(new Date(System.currentTimeMillis()));
        else
            blog.setModifiedDate(new Date(System.currentTimeMillis()));

        return blogRepository.save(blog);
    }

    public void deleteById(Long id) {
        blogRepository.delete(id);
    }

    public void delete(Blog blog) {
        blogRepository.delete(blog);
    }
}
