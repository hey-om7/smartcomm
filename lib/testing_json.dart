import 'dart:convert';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

class TestingJson extends StatefulWidget {
  const TestingJson({super.key});

  @override
  State<TestingJson> createState() => _TestingJsonState();
}

// void traverseJson(List<Map<String, dynamic>> jsonList) {
//   for (var jsonItem in jsonList) {
//     String parentValue = jsonItem['parent'];
//     print('Parent: $parentValue');

//     List<Map<String, dynamic>> childList = jsonItem['child'];
//     if (childList != null && childList.isNotEmpty) {
//       traverseJson(childList);
//     }
//   }
// }

Map<String, dynamic> jsonData = jsonDecode(jsonString);
List<dynamic> childList = jsonData["pantview"]["Dashboard"];
// List<dynamic> childList = jsonData["pantview"]["SLD"];

class _TestingJsonState extends State<TestingJson> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> jsonData = jsonDecode(jsonString);
    // printBlue();
    // String s1 = jsonData["pantview"]["SLD"][0]["parent"].toString();
    // printBlue(s1);
    // List<Map<String, dynamic>> childList =
    //     jsonData["pantview"]["SLD"][0]['child'];
    // List<dynamic> childList = jsonData["pantview"]["SLD"];
    // for (var naam in childList) {
    //   printBlue(naam["parent"].toString());
    // }
    // for (int i = 0; i < childList.length; i++) {
    //   printBlue(text)
    // }
    // List getJsonChildren(int index) {
    //   List<dynamic> childList = jsonData["pantview"]["SLD"][0]['child'];
    //   return [];
    // }
    printWarning(childList.toString());
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            ...List.generate(childList.length, (index) {
              return GestureDetector(
                onTap: () {
                  childList = childList[index]["child"];
                  print(childList);
                  setState(() {});
                },
                child: myText(
                  text: childList[index]["parent"],
                  color: Colors.black,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

String jsonString = """
{
    "message": "user details are present",
    "status": 1,
    "pantview": {
        "Dashboard": [
            {
                "child": [
                    {
                        "child": [
                            {
                                "child": [
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device1"
                                        ],
                                        "parent": "4400_Device1"
                                    },
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device2"
                                        ],
                                        "parent": "4400_Device2"
                                    },
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device3"
                                        ],
                                        "parent": "4400_Device3"
                                    },
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device4"
                                        ],
                                        "parent": "4400_Device4"
                                    },
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device5"
                                        ],
                                        "parent": "4400_Device5"
                                    },
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device6"
                                        ],
                                        "parent": "4400_Device6"
                                    }
                                ],
                                "parent": "WC4400"
                            }
                        ],
                        "parent": "Meters"
                    }
                ],
                "parent": "Devices"
            },
            {
                "child": [
                    {
                        "child": [
                            {
                                "child": [
                                    {
                                        "child": [
                                            {
                                                "child": [],
                                                "connectionstateobject": [
                                                    "_MFM_4400"
                                                ],
                                                "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                                "panelobject": [
                                                    "4400_Device1"
                                                ],
                                                "parent": "Device1"
                                            },
                                            {
                                                "child": [],
                                                "connectionstateobject": [
                                                    "_MFM_4400"
                                                ],
                                                "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                                "panelobject": [
                                                    "4400_Device2"
                                                ],
                                                "parent": "Device2"
                                            }
                                        ],
                                        "parent": "Subgroup1"
                                    },
                                    {
                                        "child": [
                                            {
                                                "child": [],
                                                "connectionstateobject": [
                                                    "_MFM_4400"
                                                ],
                                                "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                                "panelobject": [
                                                    "4400_Device3"
                                                ],
                                                "parent": "Device3"
                                            }
                                        ],
                                        "parent": "Subgroup2"
                                    }
                                ],
                                "parent": "Group1"
                            },
                            {
                                "child": [
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device4"
                                        ],
                                        "parent": "Device4"
                                    }
                                ],
                                "parent": "Group2"
                            }
                        ],
                        "parent": "Area1"
                    },
                    {
                        "child": [
                            {
                                "child": [],
                                "connectionstateobject": [
                                    "_MFM_4400"
                                ],
                                "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                "panelobject": [
                                    "4400_Device5"
                                ],
                                "parent": "Device5"
                            }
                        ],
                        "parent": "Area2"
                    },
                    {
                        "child": [
                            {
                                "child": [
                                    {
                                        "child": [],
                                        "connectionstateobject": [
                                            "_MFM_4400"
                                        ],
                                        "panelname": "../screens/user/SmartCommDashboard/Meters/WL4400/WL4400Dashboard.screen;;;",
                                        "panelobject": [
                                            "4400_Device6"
                                        ],
                                        "parent": "Device6"
                                    }
                                ],
                                "parent": "Area5"
                            }
                        ],
                        "parent": "Area3"
                    }
                ],
                "parent": "PlantView_Test"
            }
        ],
        "SLD": [
            {
                "child": [
                    {
                        "child": [
                            {
                                "child": [
                                    {
                                        "child": [
                                            {
                                                "child": [],
                                                "parent": "Device1"
                                            },
                                            {
                                                "child": [],
                                                "parent": "Device2"
                                            }
                                        ],
                                        "parent": "Subgroup1"
                                    },
                                    {
                                        "child": [
                                            {
                                                "child": [],
                                                "parent": "Device3"
                                            }
                                        ],
                                        "parent": "Subgroup2"
                                    }
                                ],
                                "parent": "Group1"
                            },
                            {
                                "child": [
                                    {
                                        "child": [],
                                        "parent": "Device4"
                                    }
                                ],
                                "parent": "Group2"
                            }
                        ],
                        "parent": "Area1"
                    },
                    {
                        "child": [
                            {
                                "child": [],
                                "parent": "Device5"
                            }
                        ],
                        "parent": "Area2"
                    },
                    {
                        "child": [
                            {
                                "child": [
                                    {
                                        "child": [],
                                        "parent": "Device6"
                                    }
                                ],
                                "parent": "Area5"
                            }
                        ],
                        "parent": "Area3"
                    }
                ],
                "parent": "PlantView_Test"
            }
        ]
    }
}
""";
