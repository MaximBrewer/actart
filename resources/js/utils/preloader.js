import { useState, useEffect } from 'react';

function usePreloader(friendID) {
  const [isOnline, setIsOnline] = useState(null);

  useEffect(() => {
    function handleStatusChange(status) {
      setIsOnline(status.isOnline);
    }
    return () => {
    };
  });

  return isOnline;
}