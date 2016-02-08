# pimatic-energy-monitor
Pimatic plugin to accumulate the electric energy consumtion of switched device and and power meters.

For example a spotlight device using 20W has been activated for 6 hours until now:
- Calculate Consumtion: A spotlight using 20W * 6 activated hours = 120Wh or 0,120kWh until now
- Calculate Cost: 0,120kWh * €0,23 energy price per kWh = €0,0276 until now (* 365 days = €10,074 cost per year)

![image](http://s17.postimg.org/3nx8sebbj/Consumptionandcostdevice.png) 

## Usage Examples
----
Installation
-------------
Add the plugin to the plugin section:

    {
      "plugin": "energy-monitor"
    },

Configuration
-------------

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


##TODO
----

* Documentation
* Build
* Test


##History
-------

* 201601, V0.0 Added Readme and documentation

* 201512, v0.0 Added GitHub project

* 201506, v0.0 Idea (https://forum.pimatic.org/topic/516/a-power-consumption-and-cost-plugin-for-pimatic-devices/8)

