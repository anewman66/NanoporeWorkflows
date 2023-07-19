# NanoporeWorkflows
My repository for scripts and workflows revolving around Nanopore sequencing. Scripts in this location will be more general, while major projects will likely have their own repositories with bespoke scripts and pipelines. 


## Introduction

The primary workflow begins from FAST5 raw sequencing data from a Nanopore sequencer. This pipeline is tested on data from an Oxford Nanopore MinION MK1C with a R 
10.4.1 flowcell using Adaptive Sampling. 

## Input files

FAST5 files are the standard output for the MinION MK1C when basecalling is not used. In this case basecalling wasn't performed because the sequencer used the Adaptive 
Sampling technique. Basecalling with Adaptive Sampling is disabled by default due to the computational limitations of the onboard GPU. POD5 is an alternative file 
format for ONT sequencers and is preferred for optimal performance by the Dorado basecaller. 

## Basecalling

Basecalling is the process of converting raw sequencer output files into nucleotide sequences. There are several basecallers that can perform this task but the main 
ones we are using are 'Guppy' and 'Dorado', which are both developed by Oxford Nanopore Technologies. Guppy is an older basecaller that can be run on either CPUs or 
GPUs while Dorado is a newer tool that is still under development (current version 0.3.2+d8660a3, 19th July 2023) that is designed to utilise GPUs. Dorado is also optimised for use 
on newer Apple Silicon processors. 

###
