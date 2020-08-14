package com.dd.service.config.script

import com.dd.service.config.builder.ConfigServerResources
import javaposse.jobdsl.dsl.JobParent

def factory = this as JobParent
def listOfEnvironment = ["dev", "qa", "prod"]
def component = "config-server-resources-job"

def emailId = "vivekmishra22117@gmail.com"
def description = "Pipeline DSL to create ECS resources for Config-Server"
def displayName = "Config-Server Fixed Resources Job"
def branchesName = "*/master"
def githubUrl = "https://github.com/vivek22117/config-server-app.git"


new ConfigServerResources(
        dslFactory: factory,
        description: description,
        jobName: component + "-" + listOfEnvironment.get(0),
        displayName: displayName + " " + listOfEnvironment.get(0),
        branchesName: branchesName,
        githubUrl: githubUrl,
        credentialId: 'github',
        environment: listOfEnvironment.get(0),
        emailId: emailId

).build()


new ConfigServerResources(
        dslFactory: factory,
        description: description,
        jobName: component + "-" + listOfEnvironment.get(1),
        displayName: displayName + " " + listOfEnvironment.get(1),
        branchesName: branchesName,
        githubUrl: githubUrl,
        credentialId: 'github',
        environment: listOfEnvironment.get(1),
        emailId: emailId
).build()


new ConfigServerResources(
        dslFactory: factory,
        description: description,
        jobName: component + "-" + listOfEnvironment.get(2),
        displayName: displayName + " "+ listOfEnvironment.get(2),
        branchesName: branchesName,
        githubUrl: githubUrl,
        credentialId: 'github',
        environment: listOfEnvironment.get(2),
        emailId: emailId
).build()
