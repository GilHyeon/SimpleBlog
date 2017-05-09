package com.gilhyeon.simpleblog.repository;

import com.gilhyeon.simpleblog.domain.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by gilhyeon on 2017-05-09.
 */
public interface BlogRepository extends JpaRepository<Blog, Long> {
}
