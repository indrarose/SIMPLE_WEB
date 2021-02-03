package net.rose.simple.controller;

import net.rose.simple.db.pojo.People;
import net.rose.simple.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping(path = "/people")
public class PeopleController {

    @Autowired
    private PeopleService peopleService;

    @GetMapping(path = "/")
    public ModelAndView index(Pageable pageable, Model model){

        System.out.println(model.asMap());
        Page<People> peoples = peopleService.find(pageable);
        ModelAndView modelAndView = new ModelAndView("people_list", model.asMap());
        modelAndView.addObject("peoples", peoples);
        return modelAndView;
    }

    @RequestMapping(path = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        return new ModelAndView("people_add", "people", new People());
    }

    @RequestMapping(path = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(
            @RequestParam Long id
    ) throws Exception {
        Optional<People> result = peopleService.getPeople(id);
        People people = result.orElseThrow(() -> new Exception("People even doesnt exist!"));
        return new ModelAndView("people_edit", "people", people);
    }

    @RequestMapping(path = "/delete", method = RequestMethod.GET)
    public String delete(
            @RequestParam Long id,
            final RedirectAttributes attributes
    ) throws Exception {
        peopleService.delete(id);
        attributes.addAttribute("message", "Successfully");
        return "redirect:/people/";
    }

    @PostMapping(path = "/save")
    public String save(
            @Valid @ModelAttribute("people") People people,
            BindingResult result,
            final RedirectAttributes attributes){

        if (result.hasErrors()) {
            return "people_add";
        }

        peopleService.save(people);
        attributes.addFlashAttribute("message", "Add Successfully");
        return "redirect:/people/";
    }

    @PostMapping(path = "/update")
    public String update(
            @Valid @ModelAttribute("people") People people,
            BindingResult result,
            final RedirectAttributes attributes){

        if (result.hasErrors()) {
            String error = result
                    .getFieldErrors()
                    .stream()
                    .map(f -> f.getField()+" "+f.getDefaultMessage())
                    .collect(Collectors.joining(", "));

            throw new IllegalArgumentException(error);
        }

        peopleService.save(people);
        attributes.addFlashAttribute("message", "Update Successfully");
        return "redirect:/people/";
    }
}
