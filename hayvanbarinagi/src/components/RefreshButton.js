import React from 'react';

function RefreshButton() {
  const handleRefresh = () => {
    window.location.reload();
  };

  return (
    <button
      onClick={handleRefresh}
      style={{
        backgroundColor: 'blue',
        color: 'white',
        padding: '10px 20px',
        border: 'none',
        borderRadius: '5px',
        marginBottom: '20px',
        cursor: 'pointer'
      }}
    >
      Refresh
    </button>
  );
}

export default RefreshButton;