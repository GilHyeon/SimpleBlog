package com.gilhyeon.simpleblog.web;

import com.gilhyeon.simpleblog.domain.Blog;
import com.gilhyeon.simpleblog.service.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by gilhyeon on 2017-05-09.
 */

@Controller
@RequestMapping("/blog")
public class BlogController {
    final static Logger logger = LoggerFactory.getLogger(BlogController.class);

    @Autowired
    BlogService blogService;

    /**
     * Pages
     */
    @RequestMapping(value = "/form", method = RequestMethod.GET)
    @Secured(value = "ROLE_USER")
    public String form() {
        return "blog/form";
    }


    @RequestMapping(value = "/form", method = RequestMethod.POST)
    public String saveForm(Blog blog) {
        logger.debug("save...");
        blogService.save(blog);
        return "redirect:/";
    }

    /**
     * APIs
     */
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    @ResponseBody
    public List<Blog> findAll() {
        logger.debug("findAll");

        return blogService.findAll();
    }

    @RequestMapping(value = "/find/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Blog find(@PathVariable Long id) {
        logger.debug("find");
        return blogService.findOne(id);
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @Secured(value = "ROLE_USER")
    public String delete(@PathVariable Long id) {
        logger.debug("deleteById by id...");

        blogService.deleteById(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @Secured(value = "ROLE_USER")
    public String delete(Blog blog) {
        logger.debug("deleteById by id...");

        blogService.delete(blog);
        return "redirect:/";
    }
}
