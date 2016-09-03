package com.test.controller;


import com.test.entity.Field;
import com.test.entity.FieldValue;
import com.test.entity.Option;
import com.test.repository.FieldRepository;
import com.test.repository.UserRepository;
import com.test.dto.FieldDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

/**
 * Created by cocozub on 19.08.2016.
 */

@Controller
public class FieldController {

    @Autowired
    private FieldRepository fieldDao;


    @RequestMapping(value = "/fields", method = RequestMethod.GET)
    public ModelAndView fields(){
        ModelMap model = new ModelMap();
        model.addAttribute("fields", fieldDao.findAll());
        return new ModelAndView("fields", model);
    }


    @RequestMapping(value = "/fields/{id}", method = RequestMethod.GET)
    public ModelAndView editCreateField (@PathVariable(value = "id") int id){
        ModelMap model = new ModelMap();
        model.addAttribute("field", fieldDao.findOne(id));
        return new ModelAndView("edit", model);
    }

    @RequestMapping(value = "/fields/{id}", method = RequestMethod.POST)
    public String fieldSave (@PathVariable(value = "id") int id, @RequestBody FieldDto fieldDto){
        Field field = fieldDao.findOne(id);
        if (field == null)
            field = new Field();
        saveField(fieldDto, field);
        return "redirect:/fields";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete (@PathVariable(value = "id") int id){
        fieldDao.delete(id);
        return "redirect:/fields";
    }

    private void saveField(FieldDto fieldDto, Field field){
        ArrayList<Option> options = new ArrayList<Option>();
        if (fieldDto.getOptions() != null){
            for (String value : fieldDto.getOptions()) {
                options.add(new Option(value, field));
            }
        }
        field.setName(fieldDto.getName());
        field.setType(fieldDto.getType());
        field.setOptions(options);
        field.setFieldsValues(new ArrayList<FieldValue>());
        field.setActive(fieldDto.isActive());
        field.setRequired(fieldDto.isRequired());
        fieldDao.save(field);
    }

}