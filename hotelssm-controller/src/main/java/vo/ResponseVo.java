package vo;



/**
 * @author 南八
 */
public class ResponseVo {
    private Object data;
    private String message;
    private String code;

    private ResponseVo(Builder builder) {
        data = builder.data;
        message = builder.message;
        code = builder.code;
    }

    public static Builder newBuilder() {
        return new Builder();
    }


    public static final class Builder {
        private Object data;
        private String message;
        private String code;

        private Builder() {
        }

        public Builder data(Object val) {
            data = val;
            return this;
        }

        public Builder message(String val) {
            message = val;
            return this;
        }

        public Builder code(String val) {
            code = val;
            return this;
        }

        public ResponseVo build() {
            return new ResponseVo(this);
        }
    }
}
