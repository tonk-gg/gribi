// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("UsedKeysIndex")))
);
ResourceId constant UsedKeysIndexTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0006020001050000000000000000000000000000000000000000000000000000
);

library UsedKeysIndex {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](2);
    _keySchema[0] = SchemaType.BYTES32;
    _keySchema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.BOOL;
    _valueSchema[1] = SchemaType.UINT40;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](2);
    keyNames[0] = "sourceTableId";
    keyNames[1] = "keysHash";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "has";
    fieldNames[1] = "index";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config (using the specified store).
   */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get has.
   */
  function getHas(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get has.
   */
  function _getHas(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get has (using the specified store).
   */
  function getHas(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set has.
   */
  function setHas(ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /**
   * @notice Set has.
   */
  function _setHas(ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /**
   * @notice Set has (using the specified store).
   */
  function setHas(IStore _store, ResourceId sourceTableId, bytes32 keysHash, bool has) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((has)), _fieldLayout);
  }

  /**
   * @notice Get index.
   */
  function getIndex(ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /**
   * @notice Get index.
   */
  function _getIndex(ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /**
   * @notice Get index (using the specified store).
   */
  function getIndex(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal view returns (uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint40(bytes5(_blob)));
  }

  /**
   * @notice Set index.
   */
  function setIndex(ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /**
   * @notice Set index.
   */
  function _setIndex(ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /**
   * @notice Set index (using the specified store).
   */
  function setIndex(IStore _store, ResourceId sourceTableId, bytes32 keysHash, uint40 index) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((index)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(ResourceId sourceTableId, bytes32 keysHash) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data (using the specified store).
   */
  function get(
    IStore _store,
    ResourceId sourceTableId,
    bytes32 keysHash
  ) internal view returns (bool has, uint40 index) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = _store.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using individual values (using the specified store).
   */
  function set(IStore _store, ResourceId sourceTableId, bytes32 keysHash, bool has, uint40 index) internal {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (bool has, uint40 index) {
    has = (_toBool(uint8(Bytes.slice1(_blob, 0))));

    index = (uint40(Bytes.slice5(_blob, 1)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (bool has, uint40 index) {
    (has, index) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Delete all data for given keys (using the specified store).
   */
  function deleteRecord(IStore _store, ResourceId sourceTableId, bytes32 keysHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(bool has, uint40 index) internal pure returns (bytes memory) {
    return abi.encodePacked(has, index);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(bool has, uint40 index) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(has, index);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(ResourceId sourceTableId, bytes32 keysHash) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = ResourceId.unwrap(sourceTableId);
    _keyTuple[1] = keysHash;

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}