package com.lut.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2024-07-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("stockout")
public class Stockout implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "stockoutid", type = IdType.AUTO)
    private Integer stockoutid;

    private Integer productid;

    private Integer quantity;

    private String outgoingperson;

    private String notes;

    private LocalDateTime stockouttime;


}
