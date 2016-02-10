module.exports = {
  title: "pimatic-energy-monitor device config schemas"
  EnergyMonitor: {
    title: "EnergyMonitor config"
    type: "object"
    extensions: ["xLink", "xAttributeOptions"]
    properties:
      measurementPoints:
        description: "Measurement points to monitor"
        type: "array"
        default: []
        format: "table"
        items:
          type: "object"
          required: ["name", "expression"]
          properties:
            name:
              description: "Name for the measurement point attribute."
              type: "string"
            deviceType:
              description: "Name for the measurement point attribute."
              type: "string"
            expression:
              description: "
                The expression used to get the value. Can be just a variable name ($myVar),
                a calculation ($myVar + 10) or a string interpolation (\"Test: {$myVar}!\")
                "
              type: "string"
            label:
              description: "A custom label to use in the frontend."
              type: "string"
              required: false
            discrete:
              description: "
                Should be set to true if the value does not change continuously over time.
              "
              type: "boolean"
              required: false
            acronym:
              description: "Acronym to show as value label in the frontend"
              type: "string"
              required: false
  }
}