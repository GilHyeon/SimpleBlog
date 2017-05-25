package com.gilhyeon.simpleblog.repository;

import com.gilhyeon.simpleblog.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by gilhyeon on 2017. 5. 19..
 */
public interface UserRepository extends JpaRepository<User, String> {
}
