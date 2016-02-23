module.exports = (env) ->
  Promise = env.require 'bluebird'
  assert = env.require 'cassert'
  _ = env.require('lodash')
  commons = require('pimatic-plugin-commons')(env)

  class EnergyMonitorPlugin extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      deviceConfigDef = require("./device-config-schema")

      @framework.deviceManager.registerDeviceClass("EnergyMonitor", {
        configDef: deviceConfigDef.EnergyMonitor,
        createCallback: (config, lastState) =>
          return new EnergyMonitor(config, lastState)
      })

  plugin = new EnergyMonitorPlugin

  class EnergyMonitor extends env.devices.Device

    constructor: (@config, lastState) ->
      @id = config.id
      @name = config.name
      @size = config.size
      @output = config.output
      @attributeValues = []
      @filterValues = []
      @sum = 0.0
      @mean = 0.0

      @varManager = plugin.framework.variableManager #so you get the variableManager
      @_exprChangeListeners = []

      for point in @config.measurementPoints
        do (point) =>
          name = point.name
          @attributeValues[name] = if lastState?[name]? then lastState[name] else 0
          @attributes = _.cloneDeep(@attributes)
          @attributes[name] = {
            description: name
            label: name
            type: "number"
          }

          if point.unit? and point.unit.length > 0
            @attributes[name].unit = point.unit

          if point.discrete?
            @attributes[name].discrete = point.discrete

          if point.acronym? and point.acronym.length > 0
            @attributes[name].acronym = point.acronym

          @_createGetter(name, =>
            return Promise.resolve @attributeValues[name]
          )
      super()



    _setAttribute: (attributeName, value) ->
      @attributeValues[attributeName] = value
      @emit attributeName, value

  return plugin
