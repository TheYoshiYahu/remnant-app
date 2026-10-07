/**
 * useEntitlement — one /me check for the S442 plan pages (partner + teacher).
 *
 * S178 pattern: hydrate the native Bearer token before /me, or an entitled
 * partner on native is checked anonymously and locked out.
 */

import { useEffect, useState } from "react";
import { getSubscriptionMe } from "../api";
import { loadStoredNativeToken } from "../native-auth";
import { hasJwtCookie } from "../display-prefs-sync";
import { isPlanEntitled, isTeacherEntitled } from "./plan-lock";

export interface Entitlement {
  loading: boolean;
  signedIn: boolean;
  partner: boolean;
  teacher: boolean;
}

export function useEntitlement(): Entitlement {
  const [ent, setEnt] = useState<Entitlement>({
    loading: true,
    signedIn: false,
    partner: false,
    teacher: false,
  });
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(() => {
      if (cancelled) return;
      const signedIn = hasJwtCookie();
      getSubscriptionMe()
        .then((me) => {
          if (cancelled) return;
          setEnt({
            loading: false,
            signedIn,
            partner: isPlanEntitled(me.status),
            teacher: isTeacherEntitled(me.status, me.tier),
          });
        })
        .catch(() => {
          if (!cancelled) setEnt({ loading: false, signedIn, partner: false, teacher: false });
        });
    });
    return () => {
      cancelled = true;
    };
  }, []);
  return ent;
}
