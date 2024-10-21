#!/bin/bash
base="$(dirname "$0")"
dotnet restore "$base/Congruence.Editor.ExternalDependency.csproj" -v diag -m --use-lock-file
dotnet build "$base/Congruence.Editor.ExternalDependency.csproj" -v diag -m
rm -r "$base/obj"

# shellcheck disable=SC2046
find "$base/bin/Debug/net48" -name '*.dll' -and -not -name 'Congruence.Editor.ExternalDependency.dll' -exec cp '{}' "$base/../0Include" \;
