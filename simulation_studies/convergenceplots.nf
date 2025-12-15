// This process generates convergence plots - figure 7

// Inputs (in order):
// simulation_studies/ConvergencePlots_Figure7.R
// simulation_studies/stats_data/stats50Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats100Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats500Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/stats1000Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats50Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats100Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats500Converge3Bins10000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins500SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins1000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins5000SamplesV2.rdata
// simulation_studies/stats_data/runningTime_sameNode/stats1000Converge3Bins10000SamplesV2.rdata


// Outputs:
// Figure_7.png


process CONVERGENCE_PLOTS{
    publishDir 'figures', mode: 'symlink'

    conda 'conda_env.yml'

    input:
        path input_script
        path input_rdata1
        path input_rdata2
        path input_rdata3
        path input_rdata4
        // stage the next input files to avoid name conflicts
        path input_rdata5, stageAs: 'node1.rdata'
        path input_rdata6, stageAs: 'node2.rdata'
        path input_rdata7, stageAs: 'node3.rdata'
        path input_rdata8, stageAs: 'node4.rdata'
        path input_rdata9, stageAs: 'node5.rdata'
        path input_rdata10, stageAs: 'node6.rdata'
        path input_rdata11, stageAs: 'node7.rdata'
        path input_rdata12, stageAs: 'node8.rdata'
        path input_rdata13, stageAs: 'node9.rdata'
        path input_rdata14, stageAs: 'node10.rdata'
        path input_rdata15, stageAs: 'node11.rdata'
        path input_rdata16, stageAs: 'node12.rdata'
        path input_rdata17, stageAs: 'node13.rdata'
        path input_rdata18, stageAs: 'node14.rdata'
        path input_rdata19, stageAs: 'node15.rdata'
        path input_rdata20, stageAs: 'node16.rdata'

    output:
        path "*.png"

    script:
    """
    Rscript ${input_script} \
        ${input_rdata1} \
        ${input_rdata2} \
        ${input_rdata3} \
        ${input_rdata4} \
        ${input_rdata5} \
        ${input_rdata6} \
        ${input_rdata7} \
        ${input_rdata8} \
        ${input_rdata9} \
        ${input_rdata10} \
        ${input_rdata11} \
        ${input_rdata12} \
        ${input_rdata13} \
        ${input_rdata14} \
        ${input_rdata15} \
        ${input_rdata16} \
        ${input_rdata17} \
        ${input_rdata18} \
        ${input_rdata19} \
        ${input_rdata20}
    """
}