/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     xds/data/orca/v3/orca_load_report.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_
#define XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_

#include "upb/msg_internal.h"
#include "upb/decode.h"
#include "upb/decode_fast.h"
#include "upb/encode.h"

#include "upb/port_def.inc"

#ifdef __cplusplus
extern "C" {
#endif

struct xds_data_orca_v3_OrcaLoadReport;
struct xds_data_orca_v3_OrcaLoadReport_RequestCostEntry;
struct xds_data_orca_v3_OrcaLoadReport_UtilizationEntry;
typedef struct xds_data_orca_v3_OrcaLoadReport xds_data_orca_v3_OrcaLoadReport;
typedef struct xds_data_orca_v3_OrcaLoadReport_RequestCostEntry xds_data_orca_v3_OrcaLoadReport_RequestCostEntry;
typedef struct xds_data_orca_v3_OrcaLoadReport_UtilizationEntry xds_data_orca_v3_OrcaLoadReport_UtilizationEntry;
extern const upb_msglayout xds_data_orca_v3_OrcaLoadReport_msginit;
extern const upb_msglayout xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_msginit;
extern const upb_msglayout xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_msginit;


/* xds.data.orca.v3.OrcaLoadReport */

UPB_INLINE xds_data_orca_v3_OrcaLoadReport *xds_data_orca_v3_OrcaLoadReport_new(upb_arena *arena) {
  return (xds_data_orca_v3_OrcaLoadReport *)_upb_msg_new(&xds_data_orca_v3_OrcaLoadReport_msginit, arena);
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport *xds_data_orca_v3_OrcaLoadReport_parse(const char *buf, size_t size,
                        upb_arena *arena) {
  xds_data_orca_v3_OrcaLoadReport *ret = xds_data_orca_v3_OrcaLoadReport_new(arena);
  if (!ret) return NULL;
  if (!upb_decode(buf, size, ret, &xds_data_orca_v3_OrcaLoadReport_msginit, arena)) return NULL;
  return ret;
}
UPB_INLINE xds_data_orca_v3_OrcaLoadReport *xds_data_orca_v3_OrcaLoadReport_parse_ex(const char *buf, size_t size,
                           const upb_extreg *extreg, int options,
                           upb_arena *arena) {
  xds_data_orca_v3_OrcaLoadReport *ret = xds_data_orca_v3_OrcaLoadReport_new(arena);
  if (!ret) return NULL;
  if (!_upb_decode(buf, size, ret, &xds_data_orca_v3_OrcaLoadReport_msginit, extreg, options, arena)) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char *xds_data_orca_v3_OrcaLoadReport_serialize(const xds_data_orca_v3_OrcaLoadReport *msg, upb_arena *arena, size_t *len) {
  return upb_encode(msg, &xds_data_orca_v3_OrcaLoadReport_msginit, arena, len);
}

UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_cpu_utilization(const xds_data_orca_v3_OrcaLoadReport *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(0, 0), double); }
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_mem_utilization(const xds_data_orca_v3_OrcaLoadReport *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(8, 8), double); }
UPB_INLINE uint64_t xds_data_orca_v3_OrcaLoadReport_rps(const xds_data_orca_v3_OrcaLoadReport *msg) { return *UPB_PTR_AT(msg, UPB_SIZE(16, 16), uint64_t); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_has_request_cost(const xds_data_orca_v3_OrcaLoadReport *msg) { return _upb_has_submsg_nohasbit(msg, UPB_SIZE(24, 24)); }
UPB_INLINE size_t xds_data_orca_v3_OrcaLoadReport_request_cost_size(const xds_data_orca_v3_OrcaLoadReport *msg) {return _upb_msg_map_size(msg, UPB_SIZE(24, 24)); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_get(const xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key, double *val) { return _upb_msg_map_get(msg, UPB_SIZE(24, 24), &key, 0, val, sizeof(*val)); }
UPB_INLINE const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* xds_data_orca_v3_OrcaLoadReport_request_cost_next(const xds_data_orca_v3_OrcaLoadReport *msg, size_t* iter) { return (const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry*)_upb_msg_map_next(msg, UPB_SIZE(24, 24), iter); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_has_utilization(const xds_data_orca_v3_OrcaLoadReport *msg) { return _upb_has_submsg_nohasbit(msg, UPB_SIZE(28, 32)); }
UPB_INLINE size_t xds_data_orca_v3_OrcaLoadReport_utilization_size(const xds_data_orca_v3_OrcaLoadReport *msg) {return _upb_msg_map_size(msg, UPB_SIZE(28, 32)); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_get(const xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key, double *val) { return _upb_msg_map_get(msg, UPB_SIZE(28, 32), &key, 0, val, sizeof(*val)); }
UPB_INLINE const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* xds_data_orca_v3_OrcaLoadReport_utilization_next(const xds_data_orca_v3_OrcaLoadReport *msg, size_t* iter) { return (const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry*)_upb_msg_map_next(msg, UPB_SIZE(28, 32), iter); }

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_cpu_utilization(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), double) = value;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_mem_utilization(xds_data_orca_v3_OrcaLoadReport *msg, double value) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 8), double) = value;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_set_rps(xds_data_orca_v3_OrcaLoadReport *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(16, 16), uint64_t) = value;
}
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_request_cost_clear(xds_data_orca_v3_OrcaLoadReport *msg) { _upb_msg_map_clear(msg, UPB_SIZE(24, 24)); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_set(xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key, double val, upb_arena *a) { return _upb_msg_map_set(msg, UPB_SIZE(24, 24), &key, 0, &val, sizeof(val), a); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_request_cost_delete(xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key) { return _upb_msg_map_delete(msg, UPB_SIZE(24, 24), &key, 0); }
UPB_INLINE xds_data_orca_v3_OrcaLoadReport_RequestCostEntry* xds_data_orca_v3_OrcaLoadReport_request_cost_nextmutable(xds_data_orca_v3_OrcaLoadReport *msg, size_t* iter) { return (xds_data_orca_v3_OrcaLoadReport_RequestCostEntry*)_upb_msg_map_next(msg, UPB_SIZE(24, 24), iter); }
UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_utilization_clear(xds_data_orca_v3_OrcaLoadReport *msg) { _upb_msg_map_clear(msg, UPB_SIZE(28, 32)); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_set(xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key, double val, upb_arena *a) { return _upb_msg_map_set(msg, UPB_SIZE(28, 32), &key, 0, &val, sizeof(val), a); }
UPB_INLINE bool xds_data_orca_v3_OrcaLoadReport_utilization_delete(xds_data_orca_v3_OrcaLoadReport *msg, upb_strview key) { return _upb_msg_map_delete(msg, UPB_SIZE(28, 32), &key, 0); }
UPB_INLINE xds_data_orca_v3_OrcaLoadReport_UtilizationEntry* xds_data_orca_v3_OrcaLoadReport_utilization_nextmutable(xds_data_orca_v3_OrcaLoadReport *msg, size_t* iter) { return (xds_data_orca_v3_OrcaLoadReport_UtilizationEntry*)_upb_msg_map_next(msg, UPB_SIZE(28, 32), iter); }

/* xds.data.orca.v3.OrcaLoadReport.RequestCostEntry */

UPB_INLINE upb_strview xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_key(const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry *msg) {
  upb_strview ret;
  _upb_msg_map_key(msg, &ret, 0);
  return ret;
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_value(const xds_data_orca_v3_OrcaLoadReport_RequestCostEntry *msg) {
  double ret;
  _upb_msg_map_value(msg, &ret, sizeof(ret));
  return ret;
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_RequestCostEntry_set_value(xds_data_orca_v3_OrcaLoadReport_RequestCostEntry *msg, double value) {
  _upb_msg_map_set_value(msg, &value, sizeof(double));
}

/* xds.data.orca.v3.OrcaLoadReport.UtilizationEntry */

UPB_INLINE upb_strview xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_key(const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry *msg) {
  upb_strview ret;
  _upb_msg_map_key(msg, &ret, 0);
  return ret;
}
UPB_INLINE double xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_value(const xds_data_orca_v3_OrcaLoadReport_UtilizationEntry *msg) {
  double ret;
  _upb_msg_map_value(msg, &ret, sizeof(ret));
  return ret;
}

UPB_INLINE void xds_data_orca_v3_OrcaLoadReport_UtilizationEntry_set_value(xds_data_orca_v3_OrcaLoadReport_UtilizationEntry *msg, double value) {
  _upb_msg_map_set_value(msg, &value, sizeof(double));
}

extern const upb_msglayout_file xds_data_orca_v3_orca_load_report_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port_undef.inc"

#endif  /* XDS_DATA_ORCA_V3_ORCA_LOAD_REPORT_PROTO_UPB_H_ */
