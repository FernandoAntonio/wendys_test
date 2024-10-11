flutter test --coverage && \
lcov --remove coverage/lcov.info \
'**/models/**' '**/*.g.dart' '**/*.freezed.dart' '**/*dependency_injection.dart' \
--ignore-errors unused -o coverage/lcov.info && \
genhtml coverage/lcov.info --output=coverage && \
open coverage/index.html
