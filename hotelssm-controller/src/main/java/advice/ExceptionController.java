package advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author 南八
 */
@ControllerAdvice
public class ExceptionController {
  /*  @ExceptionHandler(RuntimeException.class)
    public String handleRuntime(){
        return "error";
    }*/
}
