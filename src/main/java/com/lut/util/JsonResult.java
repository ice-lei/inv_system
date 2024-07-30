package com.lut.util;

import lombok.Data;

import java.io.Serializable;
@Data
public class JsonResult<E> implements Serializable {
    private Integer status;
    private String message;
    private E data;

    public JsonResult() {
    }

    public JsonResult(Integer status, String message, E data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public JsonResult(Integer status, String message) {
        this.status = status;
        this.message = message;
    }
}
