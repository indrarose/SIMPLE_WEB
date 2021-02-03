package net.rose.simple.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.lang.invoke.MethodHandles;
import java.util.Map;

import static org.springframework.boot.web.error.ErrorAttributeOptions.Include.*;


@Controller
@Lazy
public class ErrorPageController implements ErrorController {

    final static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Autowired
    private final ErrorAttributes errorAttributes;

    private static final String PATH = "/error";

    @Autowired
    public ErrorPageController(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    @RequestMapping(value = PATH, produces = {MediaType.TEXT_HTML_VALUE})
    public ModelAndView error(ServletWebRequest webRequest) {
        Map<String, Object> errors = errorAttributes.getErrorAttributes(webRequest, ErrorAttributeOptions.of(
                EXCEPTION, STACK_TRACE, MESSAGE, BINDING_ERRORS
        ));
        logger.error("WEB_ERROR "+ errors);

        return new ModelAndView("error_page", errors);
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }



}