package com.taoleonis.pmcase.web.fileupload;

import org.springframework.web.multipart.MultipartFile;

public class MultipartFileBucket {

    private MultipartFile multipartFile;

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }
}
