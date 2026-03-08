// LeekScript standard library — function signatures
// Generated from functions.json. Do not edit by hand.

function abs(real|integer number) -> integer

function acos(real|integer argument) -> real

function asin(real|integer argument) -> real

function atan(real|integer argument) -> real

function atan2(real|integer y, real|integer x) -> real

function binString(integer x) -> string

function bitCount(integer x) -> integer

function bitReverse(integer x) -> integer

function bitsToReal(integer x) -> real

function byteReverse(integer x) -> integer

function cbrt(real|integer number) -> real

function ceil(real|integer number) -> integer

function cos(real|integer angle) -> real

function exp(real|integer number) -> real

function floor(real|integer number) -> integer

function hexString(integer x) -> string

function hypot(real|integer x, real|integer y) -> real

function isFinite(real x) -> boolean

function isInfinite(real x) -> boolean

function isNaN(real x) -> boolean

function isPermutation(integer x, integer y) -> boolean

function leadingZeros(integer x) -> integer

function log(real|integer number) -> real

function log10(real|integer number) -> real

function log2(real|integer number) -> real

function max(real|integer a, real|integer b) -> real|integer

function min(real|integer a, real|integer b) -> real|integer

function number(any value) -> real

function pow(real|integer base, real|integer exp) -> real

function rand() -> real

function randFloat(real|integer a, real|integer b) -> integer

function randInt(real|integer a, real|integer b) -> integer

function randReal(real a, real b) -> real

function realBits(real x) -> integer

function rotateLeft(integer x, integer s) -> integer

function rotateRight(integer x, integer s) -> integer

function round(real|integer number) -> integer

function signum(real|integer number) -> integer

function sin(real|integer angle) -> real

function sqrt(real|integer number) -> real

function tan(real|integer angle) -> real

function toDegrees(real|integer radians) -> real

function toRadians(real|integer degrees) -> real

function trailingZeros(integer x) -> integer

function charAt(string string, real|integer position) -> string

function codePointAt(string string, integer index?) -> integer

function contains(string string, string search) -> boolean

function endsWith(string string, string suffix) -> boolean

function indexOf(string string, string search, real|integer start?) -> integer

function length(string string) -> integer

function replace(string string, string search, string replace) -> string

function split(string string, string delimiter, real|integer limit?) -> string

function startsWith(string string, string prefix) -> boolean

function string(any value) -> string

function substring(string string, real|integer start, real|integer length?) -> string

function toLower(string string) -> string

function toUpper(string string) -> string

function arrayChunk(Array array, integer chunkSize?) -> Array<Array>

function arrayConcat(Array array1, Array array2) -> Array

function arrayClear(Array array) -> void

function arrayEvery(Array array, Function callback) -> boolean

function arrayFilter(Array array, Function callback) -> Array

function arrayFlatten(Array array, real|integer depth?) -> Array

function arrayFoldLeft(Array array, Function f, any v0) -> any

function arrayFoldRight(Array array, Function f, any v0) -> any

function arrayFrequencies(Array array) -> Map<any, integer>

function arrayGet(Array array, integer index, any defaultValue?) -> any

function arrayIter(Array array, Function callback) -> void

function arrayMap(Array array, Function callback) -> Array

function arrayMax(Array array) -> any

function arrayMin(Array array) -> any

function arrayPartition(Array array, Function callback) -> Array<Array>

function arrayRandom(Array array, integer count) -> Array

function arrayRemoveAll(Array array, any element) -> void

function arraySlice(Array array, any start, any end?, integer stride?) -> Array

function arraySome(Array array, Function callback) -> boolean

function arraySort(Array array, Function callback?) -> Array

function arrayToSet(Array array) -> Set

function arrayUnique(Array array) -> Array

function average(Array<integer> array) -> real

function count(Array array) -> integer

function inArray(Array array, any element) -> boolean

function isEmpty(Array array) -> boolean

function join(Array array, string glue) -> string

function pop(Array array) -> any

function remove(Array array, real|integer position) -> any

function search(Array array, any element, real|integer start?) -> integer

function shift(Array array) -> any

function subArray(Array array, real|integer start, real|integer end) -> Array

function sum(Array<integer> array) -> real

function assocSort(Array array, real|integer order?) -> void

function fill(Array array, any value, real|integer size?) -> void

function insert(Array array, any element, real|integer position) -> void

function keySort(Array array, real|integer order?) -> void

function push(Array array, any element) -> void

function pushAll(Array array, Array elements) -> void

function removeElement(Array array, any element) -> void

function removeKey(Array array, any key) -> void

function reverse(Array array) -> void

function shuffle(Array array) -> void

function sort(Array array, real|integer order?) -> void

function unshift(Array array, any element) -> void

function mapAverage(Map map) -> real

function mapContains(Map map, any value) -> boolean

function mapContainsKey(Map map, any key) -> boolean

function mapEvery(Map map, Function callback) -> boolean

function mapFilter(Map map, Function callback) -> Map

function mapFold(Map map, Function f, any v) -> any

function mapGet(Map map, any key, any default?) -> any

function mapIsEmpty(Map map) -> boolean

function mapKeys(Map map) -> Array

function mapMap(Map map, Function callback) -> Map

function mapMax(Map map) -> real

function mapMerge(Map map1, Map map2) -> Map

function mapMin(Map map) -> real

function mapPut(Map map, any key, any value) -> any

function mapRemove(Map map, any key) -> any

function mapReplace(Map map, any key, any value) -> any

function mapReplaceAll(Map map1, Map map2) -> void

function mapSearch(Map map, any value) -> real

function mapSize(Map map) -> integer

function mapSome(Map map, Function callback) -> boolean

function mapSum(Map map) -> real

function mapValues(Map map) -> Array

function mapClear(Map map) -> void

function mapFill(Map map, any value) -> void

function mapIter(Map map, Function callback) -> void

function mapPutAll(Map map, Map elements) -> void

function mapRemoveAll(Map map, any value) -> void

function getAbsoluteShield(real|integer entity?) -> integer

function getAgility(real|integer entity?) -> integer

function getAIID(real|integer entity?) -> integer

function getAIName(real|integer entity?) -> string

function getBirthTurn(real|integer entity?) -> integer

function getCell(real|integer entity?) -> integer

function getChips(real|integer entity?) -> Array<integer>

function getCores(real|integer entity?) -> integer

function getDamageReturn(real|integer entity?) -> integer

function getEffects(real|integer entity?) -> Array<Array>

function getEntity() -> integer

function getEntityTurnOrder(real|integer entity?) -> integer

function getFarmerCountry(real|integer entity?) -> string

function getFarmerID(real|integer entity?) -> integer

function getFarmerName(real|integer entity?) -> string

function getForce(real|integer entity?) -> integer

function getFrequency(real|integer entity?) -> integer

function getItemUses(integer item) -> integer

function getLaunchedEffects(real|integer entity?) -> Array<Array>

function getLeek() -> integer

function getLeekID(real|integer entity?) -> integer

function getLevel(real|integer entity?) -> integer

function getLife(real|integer entity?) -> integer

function getMagic(real|integer entity?) -> integer

function getMP(real|integer entity?) -> integer

function getName(real|integer entity?) -> string

function getPassiveEffects(real|integer entity?) -> Array<Array>

function getPower(real|integer entity?) -> integer

function getRAM(integer entity?) -> integer

function getRelativeShield(real|integer entity?) -> integer

function getResistance(real|integer entity?) -> integer

function getScience(real|integer entity?) -> integer

function getSide(integer entity?) -> integer

function getStates(integer entity?) -> Set<integer>

function getStrength(real|integer entity?) -> integer

function getSummoner(real|integer entity?) -> integer

function getSummons(real|integer entity?) -> Array<integer>

function getTeamID(real|integer entity?) -> integer

function getTeamName(real|integer entity?) -> string

function getTotalLife(real|integer entity?) -> integer

function getTotalMP(real|integer entity?) -> integer

function getTotalTP(real|integer entity?) -> integer

function getTP(real|integer entity?) -> integer

function getType(real|integer entity?) -> integer

function getWeapon(real|integer entity?) -> integer

function getWeapons(real|integer entity?) -> Array<integer>

function getWisdom(real|integer entity?) -> integer

function isAlive(real|integer entity) -> boolean

function isAlly(real|integer entity) -> boolean

function isDead(real|integer entity) -> boolean

function isEnemy(real|integer entity) -> boolean

function isStatic(real|integer entity?) -> boolean

function isSummon(real|integer entity?) -> boolean

function listen() -> Array

function say(string message) -> void

function setWeapon(real|integer weapon) -> void

function canUseWeapon(real|integer weapon?, real|integer entity) -> boolean

function canUseWeaponOnCell(real|integer weapon?, real|integer cell) -> boolean

function getAllWeapons() -> Array<integer>

function getWeaponArea(real|integer weapon) -> integer

function getWeaponCost(real|integer weapon) -> integer

function getWeaponEffectiveArea(real|integer weapon?, real|integer cell, real|integer from?) -> Array<integer>

function getWeaponEffects(real|integer weapon?) -> Array<Array>

function getWeaponFailure(real|integer weapon) -> integer

function getWeaponLaunchType(real|integer weapon?) -> integer

function getWeaponMaxRange(real|integer weapon) -> integer

function getWeaponMaxScope(real|integer weapon) -> integer

function getWeaponMaxUses(integer weapon?) -> integer

function getWeaponMinRange(real|integer weapon) -> integer

function getWeaponMinScope(real|integer weapon) -> integer

function getWeaponName(real|integer weapon) -> string

function getWeaponPassiveEffects(real|integer weapon) -> Array<Array>

function isInlineWeapon(real|integer weapon) -> boolean

function isWeapon(real|integer value) -> boolean

function useWeapon(real|integer entity) -> integer

function useWeaponOnCell(real|integer cell) -> integer

function weaponNeedLos(real|integer weapon?) -> boolean

function canUseChip(real|integer chip, real|integer entity) -> boolean

function canUseChipOnCell(real|integer chip, real|integer cell) -> boolean

function chipNeedLos(real|integer chip) -> boolean

function getAllChips() -> Array<integer>

function getChipArea(real|integer chip) -> integer

function getChipCooldown(real|integer chip) -> integer

function getChipCost(real|integer chip) -> integer

function getChipEffectiveArea(real|integer chip, real|integer cell, real|integer from?) -> Array<integer>

function getChipEffects(real|integer chip) -> Array<Array>

function getChipFailure(real|integer chip) -> integer

function getChipLaunchType(real|integer chip) -> integer

function getChipMaxRange(real|integer chip) -> integer

function getChipMaxScope(real|integer chip) -> integer

function getChipMaxUses(integer chip) -> integer

function getChipMinRange(real|integer chip) -> integer

function getChipMinScope(real|integer chip) -> integer

function getChipName(real|integer chip) -> string

function getCooldown(real|integer chip, real|integer entity?) -> integer

function isChip(real|integer value) -> boolean

function isInlineChip(real|integer chip) -> boolean

function resurrect(real|integer entity, real|integer cell) -> integer

function summon(real|integer chip, real|integer cell, Function ai) -> integer

function useChip(real|integer chip, real|integer entity?) -> integer

function useChipOnCell(real|integer chip, real|integer cell) -> integer

function getCellContent(real|integer cell) -> integer

function getCellDistance(real|integer cell1, real|integer cell2) -> integer

function getCellFromXY(real|integer x, real|integer y) -> integer

function getCellX(real|integer cell) -> integer

function getCellY(real|integer cell) -> integer

function getDistance(real|integer cell1, real|integer cell2) -> integer

function getEntityOnCell(real|integer cell) -> integer

function getLeekOnCell(real|integer cell) -> integer

function getMapType() -> integer

function getObstacles() -> Array<integer>

function getPath(real|integer start, real|integer end, Array<integer> ignoredCells?) -> Array<integer>

function getPathLength(real|integer cell1, real|integer cell2, Array<integer> ignoredCells?) -> integer

function isEmptyCell(real|integer cell) -> boolean

function isEntity(real|integer cell) -> boolean

function isLeek(real|integer cell) -> boolean

function isObstacle(real|integer cell) -> boolean

function isOnSameLine(real|integer cell1, real|integer cell2) -> boolean

function getAliveAllies() -> Array<integer>

function getAliveAlliesCount() -> integer

function getAliveEnemies() -> Array<integer>

function getAliveEnemiesCount() -> integer

function getAllEffects() -> Array<integer>

function getAlliedTurret() -> integer

function getAllies() -> Array<integer>

function getAlliesCount() -> integer

function getAlliesLife() -> integer

function getBulbChips(real|integer bulbChip) -> Array<integer>

function getCellsToUseChip(real|integer chip, real|integer entity, Array<integer> ignoredCells?) -> Array<integer>

function getCellsToUseChipOnCell(real|integer chip, real|integer cell, Array<integer> ignoredCells?) -> Array<integer>

function getCellsToUseWeapon(real|integer weapon?, real|integer entity, Array<integer> ignoredCells?) -> Array<integer>

function getCellsToUseWeaponOnCell(real|integer weapon?, real|integer cell, Array<integer> ignoredCells?) -> Array<integer>

function getCellToUseChip(real|integer chip, real|integer entity, Array<integer> ignoredCells?) -> integer

function getCellToUseChipOnCell(real|integer chip, real|integer cell, Array<integer> ignoredCells?) -> integer

function getCellToUseWeapon(real|integer weapon?, real|integer entity, Array<integer> ignoredCells?) -> integer

function getCellToUseWeaponOnCell(real|integer weapon?, real|integer cell, Array<integer> ignoredCells?) -> integer

function getChipTargets(real|integer chip, real|integer cell) -> Array<integer>

function getDeadAllies() -> Array<integer>

function getDeadEnemies() -> Array<integer>

function getDeadEnemiesCount() -> integer

function getEnemies() -> Array<integer>

function getEnemiesCount() -> integer

function getEnemiesLife() -> integer

function getEnemyTurret() -> integer

function getFarthestAlly() -> integer

function getFarthestEnemy() -> integer

function getFightBoss() -> integer

function getFightContext() -> integer

function getFightID() -> integer

function getFightType() -> integer

function getNearestAlly() -> integer

function getNearestAllyTo(real|integer entity) -> integer

function getNearestAllyToCell(real|integer cell) -> integer

function getNearestEnemy() -> integer

function getNearestEnemyTo(real|integer entity) -> integer

function getNearestEnemyToCell(real|integer cell) -> integer

function getNextPlayer(real|integer entity?) -> integer

function getPreviousPlayer(real|integer entity?) -> integer

function getTurn() -> integer

function getWeaponTargets(real|integer weapon?, real|integer cell) -> Array<integer>

function lineOfSight(real|integer start, real|integer end, real|integer entityToIgnore?) -> boolean

function moveAwayFrom(real|integer entity, real|integer mp?) -> integer

function moveAwayFromCell(real|integer cell, real|integer mp?) -> integer

function moveAwayFromCells(Array<integer> cells, real|integer mp?) -> integer

function moveAwayFromEntities(Array<integer> entities, real|integer mp?) -> integer

function moveAwayFromLeeks(Array<integer> entities, real|integer mp?) -> integer

function moveAwayFromLine(real|integer cell1, real|integer cell2, real|integer mp?) -> integer

function moveToward(real|integer entity, real|integer mp?) -> integer

function moveTowardCell(real|integer cell, real|integer mp?) -> integer

function moveTowardCells(Array<integer> cells, real|integer mp?) -> integer

function moveTowardEntities(Array<integer> entities, real|integer mp?) -> integer

function moveTowardLeeks(Array<integer> leeks, real|integer mp?) -> integer

function moveTowardLine(real|integer cell1, real|integer cell2, real|integer mp?) -> integer

function clearMarks() -> void

function clone(any value, real|integer level?) -> any

function debug(any object) -> void

function debugC(any object, real|integer color) -> void

function debugE(any object) -> void

function debugW(any object) -> void

function deleteRegister(string key) -> void

function getDate() -> string

function getInstructionsCount() -> integer

function getMaxOperations() -> integer

function getMaxRAM() -> integer

function getOperations() -> integer

function getRegister(string key) -> string

function getRegisters() -> string

function getTime() -> string

function getTimestamp() -> integer

function getUsedRAM() -> integer

function include(string ai) -> void

function jsonDecode(string json) -> any

function jsonEncode(string object) -> string

function mark(any cells, real|integer color?, real|integer duration?) -> boolean

function markText(any cells, string text?, real|integer color?, real|integer duration?) -> boolean

function pause() -> void

function setRegister(string key, string value) -> boolean

function show(real|integer cell, real|integer color?) -> void

function typeOf(any value) -> integer

function getMessageAuthor(Array message) -> integer

function getMessageParams(Array message) -> any

function getMessages(real|integer entity?) -> Array<Array>

function getMessageType(Array message) -> integer

function sendAll(real|integer type, any params) -> void

function sendTo(real|integer entity, real|integer type, any params) -> boolean

function getBlue(real|integer color) -> integer

function getColor(real|integer red, real|integer green, real|integer blue) -> integer

function getGreen(real|integer color) -> integer

function getRed(real|integer color) -> integer

function setClear(Set set) -> Set

function setContains(Set set, any element) -> boolean

function setDifference(Set set1, Set set2) -> Set

function setDisjunction(Set set1, Set set2) -> Set

function setIntersection(Set set1, Set set2) -> Set

function setIsEmpty(Set set) -> boolean

function setIsSubsetOf(Set set1, Set set2) -> boolean

function setPut(Set set, any element) -> boolean

function setRemove(Set set, any element) -> boolean

function setSize(Set set) -> integer

function setToArray(Set set) -> Array

function setUnion(Set set1, Set set2) -> Set

function intervalAverage(Interval interval) -> real

function intervalCombine(Interval interval1, Interval interval2) -> Interval

function intervalIntersection(Interval interval1, Interval interval2) -> Interval

function intervalIsBounded(Interval interval) -> boolean

function intervalIsClosed(Interval interval) -> boolean

function intervalIsEmpty(Interval interval) -> boolean

function intervalIsLeftBounded(Interval interval) -> boolean

function intervalIsLeftClosed(Interval interval) -> boolean

function intervalIsRightBounded(Interval interval) -> boolean

function intervalIsRightClosed(Interval interval) -> boolean

function intervalMax(Interval interval) -> real|integer

function intervalMin(Interval interval) -> real|integer

function intervalSize(Interval interval) -> real|integer

function intervalToArray(Interval interval, real|integer step?) -> Array

function intervalToSet(Interval interval) -> Set
