#!/usr/bin/env dsc

%include modules/get_data
%include modules/glm.txt
%include modules/t_test.txt
%include modules/wilcox_test.txt
%include modules/run_DESeq2.txt

DSC:
  define:
    get_data: random_sample, celltype_sample
    method: glm_pois, t_test, wilcoxon_test #DESeq2
  run:
    first_pass: get_data * method
  exec_path: code
  global:
    data_file: data/rawcounts.rds
    meta_file: data/metadata.rds
