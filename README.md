# terraform-config-sample

This repository should showcase two approaches to access a nested configuration tree.

- config directory
- bottom-up

The goal is to avoid large config files with many levels.


## Sample Structure

```yaml
{
  "clouds": {
    "AWS": {
      "regions": {
        "us-east-1": {
          "teams": {
            "teamA": {
              "applications": {
                "app1": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app2": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamB": {
              "applications": {
                "app3": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app4": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        },
        "eu-west-1": {
          "teams": {
            "teamC": {
              "applications": {
                "app5": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app6": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamD": {
              "applications": {
                "app7": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app8": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        }
      }
    },
    "GCP": {
      "regions": {
        "us-central1": {
          "teams": {
            "teamE": {
              "applications": {
                "app9": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app10": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamF": {
              "applications": {
                "app11": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app12": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        },
        "europe-west1": {
          "teams": {
            "teamG": {
              "applications": {
                "app13": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app14": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamH": {
              "applications": {
                "app15": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app16": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        }
      }
    },
    "Azure": {
      "regions": {
        "eastus": {
          "teams": {
            "teamI": {
              "applications": {
                "app17": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app18": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamJ": {
              "applications": {
                "app19": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app20": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        },
        "westeurope": {
          "teams": {
            "teamK": {
              "applications": {
                "app21": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app22": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            },
            "teamL": {
              "applications": {
                "app23": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                },
                "app24": {
                  "settings": {
                    "param1": "value1",
                    "param2": "value2"
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
```