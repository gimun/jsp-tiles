package study.boot.exception;

public class Error {

    private String defaultMessage;
    private String field;

    public Error(String defaultMessage, String field) {
        this.defaultMessage = defaultMessage;
        this.field = field;
    }

    public String getDefaultMessage() {
        return defaultMessage;
    }

    public String getField() {
        return field;
    }
}
