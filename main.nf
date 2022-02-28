#!/usr/bin/env nextflow
/*
========================================================================================
    mrmarkw/readtwoalign
========================================================================================
    Github : https://github.com/mrmarkw/readtwoalign
    Website: https://nf-co.re/readtwoalign
    Slack  : https://nfcore.slack.com/channels/readtwoalign
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { READTWOALIGN } from './workflows/readtwoalign'

//
// WORKFLOW: Run main mrmarkw/readtwoalign analysis pipeline
//
workflow NFCORE_READTWOALIGN {
    READTWOALIGN ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_READTWOALIGN ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
