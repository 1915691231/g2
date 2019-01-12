package g2.controller.admin;

import g2.service.ExportService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/report")
public class ExportController {
    private ExportService exportService;

    public ExportController(ExportService exportService) {
        this.exportService = exportService;
    }

    @RequestMapping("")
    public String indexreport() {
        return "admin/indexReport";
    }

    @RequestMapping("/user")
    public String userreport() {
        exportService.reportUser();
        return "admin/indexReport";
    }

    @RequestMapping("/unit")
    public String unitreport() {
        exportService.reportUnit();
        return "admin/indexReport";
    }
}
