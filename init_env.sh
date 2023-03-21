#!/usr/bin/env sh
supabase start
supabase db reset

pushd ./
cd supabase/buckets-init
dart pub get
dart populate_buckets.dart
popd
