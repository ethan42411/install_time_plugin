# install_time_plugin

A Flutter plugin to get Android's firstInstallTime.

## Getting Started

Example:

```
final int? rawInstallTime = await InstallTimePlugin.getFirstInstallTime();

final installTime = (rawInstallTime != null)
    ? DateTime.fromMillisecondsSinceEpoch(rawInstallTime).toString()
    : 'Failed to get install time.';

print(installTime);
```

