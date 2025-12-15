#!/usr/bin/env nextflow

// Import modules
include { PAC_ANALYSIS } from './uvcb_analysis/pacanalysis.nf'


params.figure10R = 'uvcb_analysis/PACAnalysis_Figure10.R'
params.figure10_csv1 = 'uvcb_analysis/qcpheno.out_results.csv'
params.figure10_csv2 = 'uvcb_analysis/1994-House_SupTab4.csv'


// Define workflow
workflow {
    figure10R_ch = channel.fromPath(params.figure10R)
    figure10_csv1_ch = channel.fromPath(params.figure10_csv1)
    figure10_csv2_ch = channel.fromPath(params.figure10_csv2)
    PAC_ANALYSIS(figure10R_ch, figure10_csv1_ch, figure10_csv2_ch)
}