#!/usr/bin/env nextflow

// Import modules
include { PAC_ANALYSIS } from './uvcb_analysis/pacanalysis.nf'
include { CONVERGENCE_PLOTS } from './simulation_studies/convergenceplots.nf'

params.figure_7R = 'simulation_studies/ConvergencePlots_Figure7.R'
params.figure7_rdata1 = 'simulation_studies/stats_data/stats50Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata2 = 'simulation_studies/stats_data/stats100Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata3 = 'simulation_studies/stats_data/stats500Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata4 = 'simulation_studies/stats_data/stats1000Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata5 = 'simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata6 = 'simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins1000SamplesV2.Rdata'
params.figure7_rdata7 = 'simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins5000SamplesV2.Rdata'
params.figure7_rdata8 = 'simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins10000SamplesV2.Rdata'
params.figure7_rdata9 = 'simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata10 = 'simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins1000SamplesV2.Rdata'
params.figure7_rdata11 = 'simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins5000SamplesV2.Rdata'
params.figure7_rdata12 = 'simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins10000SamplesV2.Rdata'
params.figure7_rdata13 = 'simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata14 = 'simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins1000SamplesV2.Rdata'
params.figure7_rdata15 = 'simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins5000SamplesV2.Rdata'
params.figure7_rdata16 = 'simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins10000SamplesV2.Rdata'
params.figure7_rdata17 = 'simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins500SamplesV2.Rdata'
params.figure7_rdata18 = 'simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins1000SamplesV2.Rdata'
params.figure7_rdata19 = 'simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins5000SamplesV2.Rdata'
params.figure7_rdata20 = 'simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins10000SamplesV2.Rdata'

params.figure10R = 'uvcb_analysis/PACAnalysis_Figure10.R'
params.figure10_csv1 = 'uvcb_analysis/qcpheno.out_results.csv'
params.figure10_csv2 = 'uvcb_analysis/1994-House_SupTab4.csv'


// Define workflow
workflow {

    //reproduce Figure 7
    figure7R_ch = channel.fromPath(params.figure_7R)
    figure7_rdata1_ch = channel.fromPath(params.figure7_rdata1)
    figure7_rdata2_ch = channel.fromPath(params.figure7_rdata2)
    figure7_rdata3_ch = channel.fromPath(params.figure7_rdata3)
    figure7_rdata4_ch = channel.fromPath(params.figure7_rdata4)
    figure7_rdata5_ch = channel.fromPath(params.figure7_rdata5)
    figure7_rdata6_ch = channel.fromPath(params.figure7_rdata6)
    figure7_rdata7_ch = channel.fromPath(params.figure7_rdata7)
    figure7_rdata8_ch = channel.fromPath(params.figure7_rdata8)
    figure7_rdata9_ch = channel.fromPath(params.figure7_rdata9)
    figure7_rdata10_ch = channel.fromPath(params.figure7_rdata10)
    figure7_rdata11_ch = channel.fromPath(params.figure7_rdata11)
    figure7_rdata12_ch = channel.fromPath(params.figure7_rdata12)
    figure7_rdata13_ch = channel.fromPath(params.figure7_rdata13)
    figure7_rdata14_ch = channel.fromPath(params.figure7_rdata14)
    figure7_rdata15_ch = channel.fromPath(params.figure7_rdata15)
    figure7_rdata16_ch = channel.fromPath(params.figure7_rdata16)
    figure7_rdata17_ch = channel.fromPath(params.figure7_rdata17)
    figure7_rdata18_ch = channel.fromPath(params.figure7_rdata18)
    figure7_rdata19_ch = channel.fromPath(params.figure7_rdata19)
    figure7_rdata20_ch = channel.fromPath(params.figure7_rdata20)

    CONVERGENCE_PLOTS(
        figure7R_ch, figure7_rdata1_ch, 
        figure7_rdata2_ch, figure7_rdata3_ch, 
        figure7_rdata4_ch, figure7_rdata5_ch, 
        figure7_rdata6_ch, figure7_rdata7_ch, 
        figure7_rdata8_ch, figure7_rdata9_ch, 
        figure7_rdata10_ch, figure7_rdata11_ch, 
        figure7_rdata12_ch, figure7_rdata13_ch, 
        figure7_rdata14_ch, figure7_rdata15_ch, 
        figure7_rdata16_ch, figure7_rdata17_ch, 
        figure7_rdata18_ch, figure7_rdata19_ch, 
        figure7_rdata20_ch)

    // reproduce Figure 10
    figure10R_ch = channel.fromPath(params.figure10R)
    figure10_csv1_ch = channel.fromPath(params.figure10_csv1)
    figure10_csv2_ch = channel.fromPath(params.figure10_csv2)
    PAC_ANALYSIS(figure10R_ch, figure10_csv1_ch, figure10_csv2_ch)
}