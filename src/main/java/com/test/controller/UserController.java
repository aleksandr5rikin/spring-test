package com.test.controller;

import com.test.dto.UserDto;
import com.test.entity.Field;
import com.test.entity.FieldValue;
import com.test.entity.User;
import com.test.repository.FieldRepository;
import com.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import java.util.ArrayList;


/**
 * Created by cocozub on 28.08.2016.
 */

@Controller
public class UserController {
    @Autowired
    private FieldRepository fieldDao;

    @Autowired
    private UserRepository userDao;

    @ResponseBody
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration (@ModelAttribute("user") UserDto dto){
        User user = new User();
        String[] values = dto.getValue();
        String[] names = dto.getName();
        ArrayList<FieldValue> fieldValues = new ArrayList<FieldValue>();
        for (int i = 0; i < names.length; i++){
            Field field = fieldDao.findByName(names[i]);
            FieldValue tmp = new FieldValue(values[i], field, user);
            fieldValues.add(tmp);
        }
        user.setFields(fieldValues);
        userDao.save(user);
        return "Thank you for submitting your data!";
    }

    @RequestMapping(value = "/responses", method = RequestMethod.GET)
    public ModelAndView responses (){
        ModelMap model = new ModelMap();
        model.addAttribute("fields", fieldDao.findActiveFields());
        model.addAttribute("users", userDao.findAll());
        return new ModelAndView("responses", model);
    }

}
