package g2.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class admin {
    @RequestMapping("")
    public String index(){return "admin/index";}
}
