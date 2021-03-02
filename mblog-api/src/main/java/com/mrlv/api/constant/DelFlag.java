package com.mrlv.api.constant;

public enum DelFlag {

    /**
     * 有效
     */
    DEL_VALID(1),
    /**
     * 无效
     */
    DEL_INVALID(0);

    private int value;

    DelFlag(int value) { this.value = value; }

    @Override
    public String toString() {
        return String.valueOf(value);
    }

    public int getValue() {
        return value;
    }
}
