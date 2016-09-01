package com.test.controller;

import com.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;

/**
 * Created by cocozub on 31.08.2016.
 */

@Controller
public class NotifyController {

    @Autowired
    private UserRepository userDao;

    private long count;

    @MessageMapping("/notify")
    @SendTo("/topic/notify")
    @SubscribeMapping("/notify")
    public String onResponse() throws Exception {
        count = userDao.count();;
        return "Responses(" + count + ")";
    }
}
