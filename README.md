# pimatic-energy-monitor

Pimatic plugin which accumulates the electric energy consumption of PowerSwitch devices and and power meters.

For example a spotlight device using 20W has been activated for 6 hours until now:
- Calculate Consumption: A spotlight using 20W * 6 activated hours = 120Wh or 0,120kWh until now
- Calculate Cost: 0,120kWh * €0,23 energy price per kWh = €0,0276 until now (* 365 days = €10,074 cost per year)

## Status of Implementation

tbd

## Plugin Configuration

You can load the plugin by editing your `config.json` to include the following in the `plugins` section.

    {
       "plugin": "energy-monitor",
    }

## Device Configuration

Add a Energy Monitor Device device into your config.json based on these example schema ready to copy paste.

    {
      "class": "EnergyMonitor",
      "id" : "EnergyMonitor",
      "name": "Energy Monitor",
      "kwh-price": "0.23",
      "currency": "euro",
      "kw-or-kwh" kwh, 
      "device-monitor": [
        {
          "id": "switchX/power-meterY",
          "options": {
            "wattage": 20
          }
        }
      ]
    },
