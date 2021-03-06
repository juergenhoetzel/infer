(*
 * Copyright (c) 2016 - present Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

open! IStd

(** Single abstraction for all the kinds of variables in SIL *)

type t = private
  | LogicalVar of Ident.t
  | ProgramVar of Pvar.t
[@@deriving compare]

val equal : t -> t -> bool

val of_id : Ident.t -> t

val of_pvar : Pvar.t -> t

val to_exp : t -> Exp.t

val pp : Format.formatter -> t -> unit

module Map : PrettyPrintable.PPMap with type key = t

module Set : PrettyPrintable.PPSet with type elt = t
